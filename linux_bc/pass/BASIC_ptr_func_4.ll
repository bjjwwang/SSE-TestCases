; ModuleID = 'linux_bc/pass/BASIC_ptr_func_4.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_ptr_func_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %q = alloca i32 (i32*)*, align 8
  %y = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !17, metadata !DIExpression()), !dbg !18
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32 (i32*)** %q, metadata !21, metadata !DIExpression()), !dbg !26
  %call = call i32 @nd_int(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.else, !dbg !29

if.then:                                          ; preds = %entry
  store i32 (i32*)* @c, i32 (i32*)** %q, align 8, !dbg !30
  br label %if.end, !dbg !32

if.else:                                          ; preds = %entry
  store i32 (i32*)* @c, i32 (i32*)** %q, align 8, !dbg !33
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %y, metadata !35, metadata !DIExpression()), !dbg !36
  store i32 5, i32* %y, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %r, metadata !37, metadata !DIExpression()), !dbg !38
  %0 = load i32 (i32*)*, i32 (i32*)** %q, align 8, !dbg !39
  %call1 = call i32 %0(i32* %y), !dbg !39
  store i32 %call1, i32* %r, align 4, !dbg !38
  %1 = load i32, i32* %y, align 4, !dbg !40
  %cmp = icmp sge i32 %1, 7, !dbg !41
  call void @svf_assert(i1 zeroext %cmp), !dbg !42
  %2 = load i32, i32* %retval, align 4, !dbg !43
  ret i32 %2, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @nd_int() #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @c(i32* %x) #0 !dbg !44 {
entry:
  %x.addr = alloca i32*, align 8
  store i32* %x, i32** %x.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %x.addr, metadata !45, metadata !DIExpression()), !dbg !46
  %0 = load i32*, i32** %x.addr, align 8, !dbg !47
  %1 = load i32, i32* %0, align 4, !dbg !48
  %add = add nsw i32 %1, 5, !dbg !49
  %2 = load i32*, i32** %x.addr, align 8, !dbg !50
  store i32 %add, i32* %2, align 4, !dbg !51
  %call = call i32 @nd_int(), !dbg !52
  %tobool = icmp ne i32 %call, 0, !dbg !52
  %3 = zext i1 %tobool to i64, !dbg !52
  %cond = select i1 %tobool, i32 0, i32 1, !dbg !52
  ret i32 %cond, !dbg !53
}

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_ptr_func_4.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_ptr_func_4.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !14}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !DILocalVariable(name: "argc", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!18 = !DILocation(line: 7, column: 14, scope: !9)
!19 = !DILocalVariable(name: "argv", arg: 2, scope: !9, file: !10, line: 7, type: !14)
!20 = !DILocation(line: 7, column: 27, scope: !9)
!21 = !DILocalVariable(name: "q", scope: !9, file: !10, line: 8, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{!13, !25}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!26 = !DILocation(line: 8, column: 9, scope: !9)
!27 = !DILocation(line: 9, column: 7, scope: !28)
!28 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 7)
!29 = !DILocation(line: 9, column: 7, scope: !9)
!30 = !DILocation(line: 10, column: 7, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !10, line: 9, column: 17)
!32 = !DILocation(line: 11, column: 3, scope: !31)
!33 = !DILocation(line: 12, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !10, line: 11, column: 10)
!35 = !DILocalVariable(name: "y", scope: !9, file: !10, line: 14, type: !13)
!36 = !DILocation(line: 14, column: 7, scope: !9)
!37 = !DILocalVariable(name: "r", scope: !9, file: !10, line: 15, type: !13)
!38 = !DILocation(line: 15, column: 7, scope: !9)
!39 = !DILocation(line: 15, column: 11, scope: !9)
!40 = !DILocation(line: 17, column: 14, scope: !9)
!41 = !DILocation(line: 17, column: 16, scope: !9)
!42 = !DILocation(line: 17, column: 3, scope: !9)
!43 = !DILocation(line: 18, column: 1, scope: !9)
!44 = distinct !DISubprogram(name: "c", scope: !10, file: !10, line: 20, type: !23, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocalVariable(name: "x", arg: 1, scope: !44, file: !10, line: 20, type: !25)
!46 = !DILocation(line: 20, column: 12, scope: !44)
!47 = !DILocation(line: 21, column: 9, scope: !44)
!48 = !DILocation(line: 21, column: 8, scope: !44)
!49 = !DILocation(line: 21, column: 10, scope: !44)
!50 = !DILocation(line: 21, column: 4, scope: !44)
!51 = !DILocation(line: 21, column: 6, scope: !44)
!52 = !DILocation(line: 22, column: 11, scope: !44)
!53 = !DILocation(line: 22, column: 3, scope: !44)
