; ModuleID = 'mac_bc/pass/BASIC_ptr_func_0.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_ptr_func_0.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @swap(i8** noundef %p, i8** noundef %q) #0 !dbg !9 {
entry:
  %p.addr = alloca i8**, align 8
  %q.addr = alloca i8**, align 8
  %t = alloca i8*, align 8
  store i8** %p, i8*** %p.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %p.addr, metadata !17, metadata !DIExpression()), !dbg !18
  store i8** %q, i8*** %q.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %q.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %t, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = load i8**, i8*** %p.addr, align 8, !dbg !23
  %1 = load i8*, i8** %0, align 8, !dbg !24
  store i8* %1, i8** %t, align 8, !dbg !22
  %2 = load i8**, i8*** %q.addr, align 8, !dbg !25
  %3 = load i8*, i8** %2, align 8, !dbg !26
  %4 = load i8**, i8*** %p.addr, align 8, !dbg !27
  store i8* %3, i8** %4, align 8, !dbg !28
  %5 = load i8*, i8** %t, align 8, !dbg !29
  %6 = load i8**, i8*** %q.addr, align 8, !dbg !30
  store i8* %5, i8** %6, align 8, !dbg !31
  %7 = load i8**, i8*** %q.addr, align 8, !dbg !32
  %8 = load i8*, i8** %7, align 8, !dbg !33
  %9 = load i8*, i8** %t, align 8, !dbg !34
  %cmp = icmp eq i8* %8, %9, !dbg !35
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @svf_assert(i1 noundef zeroext) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !38 {
entry:
  %a1 = alloca i8, align 1
  %b1 = alloca i8, align 1
  %a = alloca i8*, align 8
  %b = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8* %a1, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i8* %b1, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i8** %a, metadata !46, metadata !DIExpression()), !dbg !47
  store i8* %a1, i8** %a, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i8** %b, metadata !48, metadata !DIExpression()), !dbg !49
  store i8* %b1, i8** %b, align 8, !dbg !49
  call void @swap(i8** noundef %a, i8** noundef %b), !dbg !50
  ret i32 0, !dbg !51
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_ptr_func_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "swap", scope: !10, file: !10, line: 3, type: !11, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!10 = !DIFile(filename: "src/pass/BASIC_ptr_func_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !{}
!17 = !DILocalVariable(name: "p", arg: 1, scope: !9, file: !10, line: 3, type: !13)
!18 = !DILocation(line: 3, column: 18, scope: !9)
!19 = !DILocalVariable(name: "q", arg: 2, scope: !9, file: !10, line: 3, type: !13)
!20 = !DILocation(line: 3, column: 28, scope: !9)
!21 = !DILocalVariable(name: "t", scope: !9, file: !10, line: 4, type: !14)
!22 = !DILocation(line: 4, column: 9, scope: !9)
!23 = !DILocation(line: 4, column: 14, scope: !9)
!24 = !DILocation(line: 4, column: 13, scope: !9)
!25 = !DILocation(line: 5, column: 14, scope: !9)
!26 = !DILocation(line: 5, column: 13, scope: !9)
!27 = !DILocation(line: 5, column: 9, scope: !9)
!28 = !DILocation(line: 5, column: 11, scope: !9)
!29 = !DILocation(line: 6, column: 13, scope: !9)
!30 = !DILocation(line: 6, column: 9, scope: !9)
!31 = !DILocation(line: 6, column: 11, scope: !9)
!32 = !DILocation(line: 7, column: 19, scope: !9)
!33 = !DILocation(line: 7, column: 18, scope: !9)
!34 = !DILocation(line: 7, column: 24, scope: !9)
!35 = !DILocation(line: 7, column: 21, scope: !9)
!36 = !DILocation(line: 7, column: 7, scope: !9)
!37 = !DILocation(line: 8, column: 1, scope: !9)
!38 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 9, type: !39, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!39 = !DISubroutineType(types: !40)
!40 = !{!41}
!41 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!42 = !DILocalVariable(name: "a1", scope: !38, file: !10, line: 10, type: !15)
!43 = !DILocation(line: 10, column: 12, scope: !38)
!44 = !DILocalVariable(name: "b1", scope: !38, file: !10, line: 10, type: !15)
!45 = !DILocation(line: 10, column: 16, scope: !38)
!46 = !DILocalVariable(name: "a", scope: !38, file: !10, line: 11, type: !14)
!47 = !DILocation(line: 11, column: 13, scope: !38)
!48 = !DILocalVariable(name: "b", scope: !38, file: !10, line: 12, type: !14)
!49 = !DILocation(line: 12, column: 13, scope: !38)
!50 = !DILocation(line: 13, column: 7, scope: !38)
!51 = !DILocation(line: 14, column: 1, scope: !38)
