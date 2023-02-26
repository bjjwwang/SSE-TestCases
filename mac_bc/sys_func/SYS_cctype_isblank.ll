; ModuleID = 'mac_bc/sys_func/SYS_cctype_isblank.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/sys_func/SYS_cctype_isblank.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %a = alloca i8, align 1
  %b = alloca i8, align 1
  %c = alloca i8, align 1
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i8* %a, metadata !17, metadata !DIExpression()), !dbg !19
  store i8 32, i8* %a, align 1, !dbg !19
  call void @llvm.dbg.declare(metadata i8* %b, metadata !20, metadata !DIExpression()), !dbg !21
  store i8 9, i8* %b, align 1, !dbg !21
  call void @llvm.dbg.declare(metadata i8* %c, metadata !22, metadata !DIExpression()), !dbg !23
  store i8 43, i8* %c, align 1, !dbg !23
  %0 = load i8, i8* %a, align 1, !dbg !24
  %conv = sext i8 %0 to i32, !dbg !24
  %call = call i32 @isblank(i32 noundef %conv) #4, !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %land.lhs.true, label %land.end, !dbg !26

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %b, align 1, !dbg !27
  %conv1 = sext i8 %1 to i32, !dbg !27
  %call2 = call i32 @isblank(i32 noundef %conv1) #4, !dbg !28
  %tobool3 = icmp ne i32 %call2, 0, !dbg !28
  br i1 %tobool3, label %land.rhs, label %land.end, !dbg !29

land.rhs:                                         ; preds = %land.lhs.true
  %2 = load i8, i8* %c, align 1, !dbg !30
  %conv4 = sext i8 %2 to i32, !dbg !30
  %call5 = call i32 @isblank(i32 noundef %conv4) #4, !dbg !31
  %tobool6 = icmp ne i32 %call5, 0, !dbg !32
  %lnot = xor i1 %tobool6, true, !dbg !32
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %entry
  %3 = phi i1 [ false, %land.lhs.true ], [ false, %entry ], [ %lnot, %land.rhs ], !dbg !33
  call void @svf_assert(i1 noundef zeroext %3), !dbg !34
  ret i32 0, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @svf_assert(i1 noundef zeroext) #2

; Function Attrs: nounwind readonly willreturn
declare i32 @isblank(i32 noundef) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/sys_func/SYS_cctype_isblank.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 4, type: !11, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/sys_func/SYS_cctype_isblank.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 6, type: !13)
!16 = !DILocation(line: 6, column: 9, scope: !9)
!17 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 7, type: !18)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 7, column: 10, scope: !9)
!20 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 8, type: !18)
!21 = !DILocation(line: 8, column: 10, scope: !9)
!22 = !DILocalVariable(name: "c", scope: !9, file: !10, line: 9, type: !18)
!23 = !DILocation(line: 9, column: 10, scope: !9)
!24 = !DILocation(line: 10, column: 24, scope: !9)
!25 = !DILocation(line: 10, column: 16, scope: !9)
!26 = !DILocation(line: 10, column: 27, scope: !9)
!27 = !DILocation(line: 10, column: 38, scope: !9)
!28 = !DILocation(line: 10, column: 30, scope: !9)
!29 = !DILocation(line: 10, column: 41, scope: !9)
!30 = !DILocation(line: 10, column: 54, scope: !9)
!31 = !DILocation(line: 10, column: 46, scope: !9)
!32 = !DILocation(line: 10, column: 45, scope: !9)
!33 = !DILocation(line: 0, scope: !9)
!34 = !DILocation(line: 10, column: 5, scope: !9)
!35 = !DILocation(line: 11, column: 5, scope: !9)
