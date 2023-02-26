; ModuleID = 'linux_bc/pass/BASIC_ptr_func_0.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_ptr_func_0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @swap(i8** %p, i8** %q) #0 !dbg !9 {
entry:
  %p.addr = alloca i8**, align 8
  %q.addr = alloca i8**, align 8
  %t = alloca i8*, align 8
  store i8** %p, i8*** %p.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %p.addr, metadata !16, metadata !DIExpression()), !dbg !17
  store i8** %q, i8*** %q.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %q.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %t, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i8**, i8*** %p.addr, align 8, !dbg !22
  %1 = load i8*, i8** %0, align 8, !dbg !23
  store i8* %1, i8** %t, align 8, !dbg !21
  %2 = load i8**, i8*** %q.addr, align 8, !dbg !24
  %3 = load i8*, i8** %2, align 8, !dbg !25
  %4 = load i8**, i8*** %p.addr, align 8, !dbg !26
  store i8* %3, i8** %4, align 8, !dbg !27
  %5 = load i8*, i8** %t, align 8, !dbg !28
  %6 = load i8**, i8*** %q.addr, align 8, !dbg !29
  store i8* %5, i8** %6, align 8, !dbg !30
  %7 = load i8**, i8*** %q.addr, align 8, !dbg !31
  %8 = load i8*, i8** %7, align 8, !dbg !32
  %9 = load i8*, i8** %t, align 8, !dbg !33
  %cmp = icmp eq i8* %8, %9, !dbg !34
  call void @svf_assert(i1 zeroext %cmp), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @svf_assert(i1 zeroext) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !37 {
entry:
  %a1 = alloca i8, align 1
  %b1 = alloca i8, align 1
  %a = alloca i8*, align 8
  %b = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8* %a1, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i8* %b1, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i8** %a, metadata !45, metadata !DIExpression()), !dbg !46
  store i8* %a1, i8** %a, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i8** %b, metadata !47, metadata !DIExpression()), !dbg !48
  store i8* %b1, i8** %b, align 8, !dbg !48
  call void @swap(i8** %a, i8** %b), !dbg !49
  ret i32 0, !dbg !50
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_ptr_func_0.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "swap", scope: !10, file: !10, line: 3, type: !11, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_ptr_func_0.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "p", arg: 1, scope: !9, file: !10, line: 3, type: !13)
!17 = !DILocation(line: 3, column: 18, scope: !9)
!18 = !DILocalVariable(name: "q", arg: 2, scope: !9, file: !10, line: 3, type: !13)
!19 = !DILocation(line: 3, column: 28, scope: !9)
!20 = !DILocalVariable(name: "t", scope: !9, file: !10, line: 4, type: !14)
!21 = !DILocation(line: 4, column: 9, scope: !9)
!22 = !DILocation(line: 4, column: 14, scope: !9)
!23 = !DILocation(line: 4, column: 13, scope: !9)
!24 = !DILocation(line: 5, column: 14, scope: !9)
!25 = !DILocation(line: 5, column: 13, scope: !9)
!26 = !DILocation(line: 5, column: 9, scope: !9)
!27 = !DILocation(line: 5, column: 11, scope: !9)
!28 = !DILocation(line: 6, column: 13, scope: !9)
!29 = !DILocation(line: 6, column: 9, scope: !9)
!30 = !DILocation(line: 6, column: 11, scope: !9)
!31 = !DILocation(line: 7, column: 19, scope: !9)
!32 = !DILocation(line: 7, column: 18, scope: !9)
!33 = !DILocation(line: 7, column: 24, scope: !9)
!34 = !DILocation(line: 7, column: 21, scope: !9)
!35 = !DILocation(line: 7, column: 7, scope: !9)
!36 = !DILocation(line: 8, column: 1, scope: !9)
!37 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 9, type: !38, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{!40}
!40 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!41 = !DILocalVariable(name: "a1", scope: !37, file: !10, line: 10, type: !15)
!42 = !DILocation(line: 10, column: 12, scope: !37)
!43 = !DILocalVariable(name: "b1", scope: !37, file: !10, line: 10, type: !15)
!44 = !DILocation(line: 10, column: 16, scope: !37)
!45 = !DILocalVariable(name: "a", scope: !37, file: !10, line: 11, type: !14)
!46 = !DILocation(line: 11, column: 13, scope: !37)
!47 = !DILocalVariable(name: "b", scope: !37, file: !10, line: 12, type: !14)
!48 = !DILocation(line: 12, column: 13, scope: !37)
!49 = !DILocation(line: 13, column: 7, scope: !37)
!50 = !DILocation(line: 14, column: 1, scope: !37)
