; ModuleID = 'mac_bc/unpass/BASIC_ptr_func_2.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/unpass/BASIC_ptr_func_2.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %p = alloca i32 ()*, align 8
  %q = alloca i32 ()*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !18, metadata !DIExpression()), !dbg !19
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32 ()** %p, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32 ()** %q, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = load i32, i32* %argc.addr, align 4, !dbg !29
  %cmp = icmp eq i32 %0, 1, !dbg !31
  br i1 %cmp, label %if.then, label %if.else, !dbg !32

if.then:                                          ; preds = %entry
  store i32 ()* @a, i32 ()** %p, align 8, !dbg !33
  store i32 ()* @c, i32 ()** %q, align 8, !dbg !35
  br label %if.end, !dbg !36

if.else:                                          ; preds = %entry
  store i32 ()* @b, i32 ()** %p, align 8, !dbg !37
  store i32 ()* @d, i32 ()** %q, align 8, !dbg !39
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %x, metadata !40, metadata !DIExpression()), !dbg !41
  %1 = load i32 ()*, i32 ()** %p, align 8, !dbg !42
  %call = call i32 %1(), !dbg !42
  store i32 %call, i32* %x, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata i32* %y, metadata !43, metadata !DIExpression()), !dbg !44
  %2 = load i32 ()*, i32 ()** %q, align 8, !dbg !45
  %call1 = call i32 %2(), !dbg !45
  store i32 %call1, i32* %y, align 4, !dbg !44
  %3 = load i32, i32* %x, align 4, !dbg !46
  %cmp2 = icmp sge i32 %3, 5, !dbg !47
  call void @svf_assert(i1 noundef zeroext %cmp2), !dbg !48
  ret i32 0, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @a() #0 !dbg !50 {
entry:
  ret i32 10, !dbg !51
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @c() #0 !dbg !52 {
entry:
  ret i32 15, !dbg !53
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @b() #0 !dbg !54 {
entry:
  ret i32 5, !dbg !55
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @d() #0 !dbg !56 {
entry:
  ret i32 20, !dbg !57
}

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/unpass/BASIC_ptr_func_2.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!10 = !DIFile(filename: "src/unpass/BASIC_ptr_func_2.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !14}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{}
!18 = !DILocalVariable(name: "argc", arg: 1, scope: !9, file: !10, line: 8, type: !13)
!19 = !DILocation(line: 8, column: 14, scope: !9)
!20 = !DILocalVariable(name: "argv", arg: 2, scope: !9, file: !10, line: 8, type: !14)
!21 = !DILocation(line: 8, column: 27, scope: !9)
!22 = !DILocalVariable(name: "p", scope: !9, file: !10, line: 9, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{!13}
!26 = !DILocation(line: 9, column: 9, scope: !9)
!27 = !DILocalVariable(name: "q", scope: !9, file: !10, line: 10, type: !23)
!28 = !DILocation(line: 10, column: 9, scope: !9)
!29 = !DILocation(line: 12, column: 7, scope: !30)
!30 = distinct !DILexicalBlock(scope: !9, file: !10, line: 12, column: 7)
!31 = !DILocation(line: 12, column: 12, scope: !30)
!32 = !DILocation(line: 12, column: 7, scope: !9)
!33 = !DILocation(line: 13, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !10, line: 12, column: 18)
!35 = !DILocation(line: 14, column: 9, scope: !34)
!36 = !DILocation(line: 15, column: 3, scope: !34)
!37 = !DILocation(line: 16, column: 9, scope: !38)
!38 = distinct !DILexicalBlock(scope: !30, file: !10, line: 15, column: 10)
!39 = !DILocation(line: 17, column: 9, scope: !38)
!40 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 20, type: !13)
!41 = !DILocation(line: 20, column: 7, scope: !9)
!42 = !DILocation(line: 20, column: 11, scope: !9)
!43 = !DILocalVariable(name: "y", scope: !9, file: !10, line: 21, type: !13)
!44 = !DILocation(line: 21, column: 7, scope: !9)
!45 = !DILocation(line: 21, column: 11, scope: !9)
!46 = !DILocation(line: 23, column: 14, scope: !9)
!47 = !DILocation(line: 23, column: 16, scope: !9)
!48 = !DILocation(line: 23, column: 3, scope: !9)
!49 = !DILocation(line: 29, column: 3, scope: !9)
!50 = distinct !DISubprogram(name: "a", scope: !10, file: !10, line: 32, type: !24, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!51 = !DILocation(line: 32, column: 10, scope: !50)
!52 = distinct !DISubprogram(name: "c", scope: !10, file: !10, line: 34, type: !24, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!53 = !DILocation(line: 34, column: 10, scope: !52)
!54 = distinct !DISubprogram(name: "b", scope: !10, file: !10, line: 33, type: !24, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!55 = !DILocation(line: 33, column: 10, scope: !54)
!56 = distinct !DISubprogram(name: "d", scope: !10, file: !10, line: 35, type: !24, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!57 = !DILocation(line: 35, column: 10, scope: !56)
