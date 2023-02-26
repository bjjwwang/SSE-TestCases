; ModuleID = 'linux_bc/pass/INTERVAL_test_43.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_43.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@count = dso_local global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @power(i32 %a, i32 %b) #0 !dbg !14 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i32, i32* @count, align 4, !dbg !21
  %inc = add nsw i32 %0, 1, !dbg !21
  store i32 %inc, i32* @count, align 4, !dbg !21
  %1 = load i32, i32* %b.addr, align 4, !dbg !22
  %cmp = icmp slt i32 %1, 0, !dbg !24
  br i1 %cmp, label %if.then, label %if.else, !dbg !25

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !26
  br label %return, !dbg !26

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %b.addr, align 4, !dbg !28
  %cmp1 = icmp eq i32 %2, 0, !dbg !30
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !31

if.then2:                                         ; preds = %if.else
  store i32 1, i32* %retval, align 4, !dbg !32
  br label %return, !dbg !32

if.else3:                                         ; preds = %if.else
  %3 = load i32, i32* %a.addr, align 4, !dbg !34
  %4 = load i32, i32* %a.addr, align 4, !dbg !36
  %5 = load i32, i32* %b.addr, align 4, !dbg !37
  %sub = sub nsw i32 %5, 1, !dbg !38
  %call = call i32 @power(i32 %4, i32 %sub), !dbg !39
  %mul = mul nsw i32 %3, %call, !dbg !40
  store i32 %mul, i32* %retval, align 4, !dbg !41
  br label %return, !dbg !41

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !42
  ret i32 %6, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i32* %b, metadata !48, metadata !DIExpression()), !dbg !49
  %0 = load i32, i32* %a, align 4, !dbg !50
  %1 = load i32, i32* %b, align 4, !dbg !51
  %call = call i32 @power(i32 %0, i32 %1), !dbg !52
  %2 = load i32, i32* %b, align 4, !dbg !53
  %cmp = icmp sgt i32 %2, 0, !dbg !55
  br i1 %cmp, label %if.then, label %if.else, !dbg !56

if.then:                                          ; preds = %entry
  %3 = load i32, i32* @count, align 4, !dbg !57
  %4 = load i32, i32* %b, align 4, !dbg !59
  %add = add nsw i32 %4, 1, !dbg !60
  %cmp1 = icmp eq i32 %3, %add, !dbg !61
  call void @svf_assert(i1 zeroext %cmp1), !dbg !62
  br label %if.end, !dbg !63

if.else:                                          ; preds = %entry
  %5 = load i32, i32* @count, align 4, !dbg !64
  %cmp2 = icmp eq i32 %5, 1, !dbg !66
  call void @svf_assert(i1 zeroext %cmp2), !dbg !67
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !68
  ret i32 %6, !dbg !68
}

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !6, line: 8, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_43.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "src/pass/INTERVAL_test_43.c", directory: "/home/SVF-tools/SSE-TestCases")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "power", scope: !6, file: !6, line: 10, type: !15, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{!7, !7, !7}
!17 = !DILocalVariable(name: "a", arg: 1, scope: !14, file: !6, line: 10, type: !7)
!18 = !DILocation(line: 10, column: 15, scope: !14)
!19 = !DILocalVariable(name: "b", arg: 2, scope: !14, file: !6, line: 10, type: !7)
!20 = !DILocation(line: 10, column: 22, scope: !14)
!21 = !DILocation(line: 11, column: 10, scope: !14)
!22 = !DILocation(line: 12, column: 8, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !6, line: 12, column: 8)
!24 = !DILocation(line: 12, column: 10, scope: !23)
!25 = !DILocation(line: 12, column: 8, scope: !14)
!26 = !DILocation(line: 13, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !6, line: 12, column: 15)
!28 = !DILocation(line: 15, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !23, file: !6, line: 15, column: 13)
!30 = !DILocation(line: 15, column: 15, scope: !29)
!31 = !DILocation(line: 15, column: 13, scope: !23)
!32 = !DILocation(line: 16, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !6, line: 15, column: 21)
!34 = !DILocation(line: 19, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !29, file: !6, line: 18, column: 10)
!36 = !DILocation(line: 19, column: 26, scope: !35)
!37 = !DILocation(line: 19, column: 29, scope: !35)
!38 = !DILocation(line: 19, column: 31, scope: !35)
!39 = !DILocation(line: 19, column: 20, scope: !35)
!40 = !DILocation(line: 19, column: 18, scope: !35)
!41 = !DILocation(line: 19, column: 9, scope: !35)
!42 = !DILocation(line: 21, column: 1, scope: !14)
!43 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 22, type: !44, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DISubroutineType(types: !45)
!45 = !{!7}
!46 = !DILocalVariable(name: "a", scope: !43, file: !6, line: 23, type: !7)
!47 = !DILocation(line: 23, column: 9, scope: !43)
!48 = !DILocalVariable(name: "b", scope: !43, file: !6, line: 24, type: !7)
!49 = !DILocation(line: 24, column: 9, scope: !43)
!50 = !DILocation(line: 25, column: 11, scope: !43)
!51 = !DILocation(line: 25, column: 14, scope: !43)
!52 = !DILocation(line: 25, column: 5, scope: !43)
!53 = !DILocation(line: 26, column: 8, scope: !54)
!54 = distinct !DILexicalBlock(scope: !43, file: !6, line: 26, column: 8)
!55 = !DILocation(line: 26, column: 10, scope: !54)
!56 = !DILocation(line: 26, column: 8, scope: !43)
!57 = !DILocation(line: 27, column: 20, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !6, line: 26, column: 15)
!59 = !DILocation(line: 27, column: 29, scope: !58)
!60 = !DILocation(line: 27, column: 31, scope: !58)
!61 = !DILocation(line: 27, column: 26, scope: !58)
!62 = !DILocation(line: 27, column: 9, scope: !58)
!63 = !DILocation(line: 28, column: 5, scope: !58)
!64 = !DILocation(line: 30, column: 20, scope: !65)
!65 = distinct !DILexicalBlock(scope: !54, file: !6, line: 29, column: 10)
!66 = !DILocation(line: 30, column: 26, scope: !65)
!67 = !DILocation(line: 30, column: 9, scope: !65)
!68 = !DILocation(line: 32, column: 1, scope: !43)
