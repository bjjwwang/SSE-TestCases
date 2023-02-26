; ModuleID = 'mac_bc/pass/BASIC_ptr_func_6.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_ptr_func_6.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !9 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %q = alloca void (i32*)*, align 8
  %y = alloca i32, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !18, metadata !DIExpression()), !dbg !19
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata void (i32*)** %q, metadata !22, metadata !DIExpression()), !dbg !27
  store void (i32*)* @c, void (i32*)** %q, align 8, !dbg !27
  %call = call i32 @nd_int(), !dbg !28
  call void @llvm.dbg.declare(metadata i32* %y, metadata !29, metadata !DIExpression()), !dbg !30
  store i32 5, i32* %y, align 4, !dbg !30
  %0 = load void (i32*)*, void (i32*)** %q, align 8, !dbg !31
  call void %0(i32* noundef %y), !dbg !31
  %1 = load i32, i32* %y, align 4, !dbg !32
  %cmp = icmp sge i32 %1, 7, !dbg !33
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !34
  ret i32 0, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @c(i32* noundef %x) #0 !dbg !36 {
entry:
  %x.addr = alloca i32*, align 8
  store i32* %x, i32** %x.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %x.addr, metadata !37, metadata !DIExpression()), !dbg !38
  %0 = load i32*, i32** %x.addr, align 8, !dbg !39
  %1 = load i32, i32* %0, align 4, !dbg !40
  %add = add nsw i32 %1, 5, !dbg !41
  %2 = load i32*, i32** %x.addr, align 8, !dbg !42
  store i32 %add, i32* %2, align 4, !dbg !43
  %call = call i32 @nd_int(), !dbg !44
  ret void, !dbg !45
}

declare i32 @nd_int() #2

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_ptr_func_6.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!10 = !DIFile(filename: "src/pass/BASIC_ptr_func_6.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !14}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{}
!18 = !DILocalVariable(name: "argc", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!19 = !DILocation(line: 7, column: 14, scope: !9)
!20 = !DILocalVariable(name: "argv", arg: 2, scope: !9, file: !10, line: 7, type: !14)
!21 = !DILocation(line: 7, column: 27, scope: !9)
!22 = !DILocalVariable(name: "q", scope: !9, file: !10, line: 8, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !26}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!27 = !DILocation(line: 8, column: 10, scope: !9)
!28 = !DILocation(line: 9, column: 3, scope: !9)
!29 = !DILocalVariable(name: "y", scope: !9, file: !10, line: 11, type: !13)
!30 = !DILocation(line: 11, column: 7, scope: !9)
!31 = !DILocation(line: 12, column: 3, scope: !9)
!32 = !DILocation(line: 14, column: 14, scope: !9)
!33 = !DILocation(line: 14, column: 16, scope: !9)
!34 = !DILocation(line: 14, column: 3, scope: !9)
!35 = !DILocation(line: 15, column: 1, scope: !9)
!36 = distinct !DISubprogram(name: "c", scope: !10, file: !10, line: 17, type: !24, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!37 = !DILocalVariable(name: "x", arg: 1, scope: !36, file: !10, line: 17, type: !26)
!38 = !DILocation(line: 17, column: 13, scope: !36)
!39 = !DILocation(line: 18, column: 9, scope: !36)
!40 = !DILocation(line: 18, column: 8, scope: !36)
!41 = !DILocation(line: 18, column: 10, scope: !36)
!42 = !DILocation(line: 18, column: 4, scope: !36)
!43 = !DILocation(line: 18, column: 6, scope: !36)
!44 = !DILocation(line: 19, column: 3, scope: !36)
!45 = !DILocation(line: 20, column: 1, scope: !36)
