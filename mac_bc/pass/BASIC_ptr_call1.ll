; ModuleID = 'mac_bc/pass/BASIC_ptr_call1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_ptr_call1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %p = alloca i32 ()*, align 8
  %q = alloca i32 (i32)*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32 ()** %p, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32 (i32)** %q, metadata !18, metadata !DIExpression()), !dbg !22
  %call = call i32 @nd_int(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !26

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i32* %x, metadata !28, metadata !DIExpression()), !dbg !29
  %call1 = call i32 @a(), !dbg !30
  store i32 %call1, i32* %x, align 4, !dbg !29
  call void @llvm.dbg.declare(metadata i32* %y, metadata !31, metadata !DIExpression()), !dbg !32
  %call2 = call i32 @c(i32 noundef 2), !dbg !33
  store i32 %call2, i32* %y, align 4, !dbg !32
  %0 = load i32, i32* %x, align 4, !dbg !34
  %cmp = icmp sge i32 %0, 5, !dbg !35
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !36

land.rhs:                                         ; preds = %if.end
  %1 = load i32, i32* %y, align 4, !dbg !37
  %cmp3 = icmp sge i32 %1, 7, !dbg !38
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end
  %2 = phi i1 [ false, %if.end ], [ %cmp3, %land.rhs ], !dbg !39
  call void @svf_assert(i1 noundef zeroext %2), !dbg !40
  ret i32 0, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @nd_int() #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @a() #0 !dbg !42 {
entry:
  ret i32 10, !dbg !43
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @c(i32 noundef %x) #0 !dbg !44 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !45, metadata !DIExpression()), !dbg !46
  %0 = load i32, i32* %x.addr, align 4, !dbg !47
  %add = add nsw i32 %0, 5, !dbg !48
  ret i32 %add, !dbg !49
}

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_ptr_call1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 9, type: !11, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/BASIC_ptr_call1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "p", scope: !9, file: !10, line: 10, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!17 = !DILocation(line: 10, column: 9, scope: !9)
!18 = !DILocalVariable(name: "q", scope: !9, file: !10, line: 11, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DISubroutineType(types: !21)
!21 = !{!13, !13}
!22 = !DILocation(line: 11, column: 9, scope: !9)
!23 = !DILocation(line: 13, column: 7, scope: !24)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 13, column: 7)
!25 = !DILocation(line: 13, column: 7, scope: !9)
!26 = !DILocation(line: 19, column: 3, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !10, line: 13, column: 17)
!28 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 21, type: !13)
!29 = !DILocation(line: 21, column: 7, scope: !9)
!30 = !DILocation(line: 21, column: 11, scope: !9)
!31 = !DILocalVariable(name: "y", scope: !9, file: !10, line: 22, type: !13)
!32 = !DILocation(line: 22, column: 7, scope: !9)
!33 = !DILocation(line: 22, column: 11, scope: !9)
!34 = !DILocation(line: 24, column: 14, scope: !9)
!35 = !DILocation(line: 24, column: 15, scope: !9)
!36 = !DILocation(line: 24, column: 20, scope: !9)
!37 = !DILocation(line: 24, column: 23, scope: !9)
!38 = !DILocation(line: 24, column: 24, scope: !9)
!39 = !DILocation(line: 0, scope: !9)
!40 = !DILocation(line: 24, column: 3, scope: !9)
!41 = !DILocation(line: 26, column: 3, scope: !9)
!42 = distinct !DISubprogram(name: "a", scope: !10, file: !10, line: 29, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!43 = !DILocation(line: 29, column: 10, scope: !42)
!44 = distinct !DISubprogram(name: "c", scope: !10, file: !10, line: 30, type: !20, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!45 = !DILocalVariable(name: "x", arg: 1, scope: !44, file: !10, line: 30, type: !13)
!46 = !DILocation(line: 30, column: 11, scope: !44)
!47 = !DILocation(line: 30, column: 22, scope: !44)
!48 = !DILocation(line: 30, column: 23, scope: !44)
!49 = !DILocation(line: 30, column: 15, scope: !44)
