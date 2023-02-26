; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_03-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_03-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo(i32* %i) #0 !dbg !9 {
entry:
  %i.addr = alloca i32*, align 8
  store i32* %i, i32** %i.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %i.addr, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i32*, i32** %i.addr, align 8, !dbg !17
  %1 = load i32, i32* %0, align 4, !dbg !18
  %add = add nsw i32 %1, 1, !dbg !19
  %2 = load i32*, i32** %i.addr, align 8, !dbg !20
  store i32 %add, i32* %2, align 4, !dbg !21
  %3 = load i32*, i32** %i.addr, align 8, !dbg !22
  %4 = load i32, i32* %3, align 4, !dbg !24
  %cmp = icmp slt i32 %4, 10, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %i.addr, align 8, !dbg !27
  call void @foo(i32* %5), !dbg !29
  br label %if.end, !dbg !30

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !32 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [50 x i32], align 16
  %i = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [50 x i32]* %buffer, metadata !35, metadata !DIExpression()), !dbg !39
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !40
  call void @srand(i32 %call) #4, !dbg !41
  call void @llvm.dbg.declare(metadata i32* %i, metadata !42, metadata !DIExpression()), !dbg !43
  %call1 = call i32 @rand() #4, !dbg !44
  %rem = srem i32 %call1, 20, !dbg !45
  store i32 %rem, i32* %i, align 4, !dbg !43
  call void @foo(i32* %i), !dbg !46
  call void @llvm.dbg.declare(metadata i32* %x, metadata !47, metadata !DIExpression()), !dbg !49
  %0 = load i32, i32* %i, align 4, !dbg !50
  store i32 %0, i32* %x, align 4, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %x, align 4, !dbg !52
  %2 = load i32, i32* %i, align 4, !dbg !54
  %cmp = icmp slt i32 %1, %2, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %x, align 4, !dbg !57
  %idxprom = sext i32 %3 to i64, !dbg !59
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !59
  store i32 1, i32* %arrayidx, align 4, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %x, align 4, !dbg !62
  %inc = add nsw i32 %4, 1, !dbg !62
  store i32 %inc, i32* %x, align 4, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %5 = load i32, i32* %retval, align 4, !dbg !67
  ret i32 %5, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_03-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "foo", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_03-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!16 = !DILocation(line: 7, column: 15, scope: !9)
!17 = !DILocation(line: 8, column: 11, scope: !9)
!18 = !DILocation(line: 8, column: 10, scope: !9)
!19 = !DILocation(line: 8, column: 13, scope: !9)
!20 = !DILocation(line: 8, column: 6, scope: !9)
!21 = !DILocation(line: 8, column: 8, scope: !9)
!22 = !DILocation(line: 9, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 8)
!24 = !DILocation(line: 9, column: 8, scope: !23)
!25 = !DILocation(line: 9, column: 11, scope: !23)
!26 = !DILocation(line: 9, column: 8, scope: !9)
!27 = !DILocation(line: 10, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !23, file: !10, line: 9, column: 17)
!29 = !DILocation(line: 10, column: 9, scope: !28)
!30 = !DILocation(line: 11, column: 5, scope: !28)
!31 = !DILocation(line: 12, column: 1, scope: !9)
!32 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 14, type: !33, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{!14}
!35 = !DILocalVariable(name: "buffer", scope: !32, file: !10, line: 15, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 1600, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 15, column: 6, scope: !32)
!40 = !DILocation(line: 16, column: 8, scope: !32)
!41 = !DILocation(line: 16, column: 2, scope: !32)
!42 = !DILocalVariable(name: "i", scope: !32, file: !10, line: 17, type: !14)
!43 = !DILocation(line: 17, column: 9, scope: !32)
!44 = !DILocation(line: 17, column: 13, scope: !32)
!45 = !DILocation(line: 17, column: 20, scope: !32)
!46 = !DILocation(line: 18, column: 5, scope: !32)
!47 = !DILocalVariable(name: "x", scope: !48, file: !10, line: 20, type: !14)
!48 = distinct !DILexicalBlock(scope: !32, file: !10, line: 20, column: 2)
!49 = !DILocation(line: 20, column: 10, scope: !48)
!50 = !DILocation(line: 20, column: 14, scope: !48)
!51 = !DILocation(line: 20, column: 6, scope: !48)
!52 = !DILocation(line: 20, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !48, file: !10, line: 20, column: 2)
!54 = !DILocation(line: 20, column: 21, scope: !53)
!55 = !DILocation(line: 20, column: 19, scope: !53)
!56 = !DILocation(line: 20, column: 2, scope: !48)
!57 = !DILocation(line: 21, column: 10, scope: !58)
!58 = distinct !DILexicalBlock(scope: !53, file: !10, line: 20, column: 29)
!59 = !DILocation(line: 21, column: 3, scope: !58)
!60 = !DILocation(line: 21, column: 13, scope: !58)
!61 = !DILocation(line: 22, column: 2, scope: !58)
!62 = !DILocation(line: 20, column: 25, scope: !53)
!63 = !DILocation(line: 20, column: 2, scope: !53)
!64 = distinct !{!64, !56, !65, !66}
!65 = !DILocation(line: 22, column: 2, scope: !48)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 23, column: 1, scope: !32)
